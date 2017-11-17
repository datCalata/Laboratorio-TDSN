function assessVariableEqual(variableName, expectedValue, varargin)

% valores por defecto
AbsoluteTolerance = 0.0001;
RelativeTolerance = 0.001;
Feedback = '';

for n = 1:2:length(varargin)
    key = varargin{n};
    value = varargin{n+1};
    switch key
        case 'Feedback'
            Feedback = value;
        case 'RelativeTolerance'
            RelativeTolerance = value;
        case 'AbsoluteTolerance'
            AbsoluteTolerance = value;
    end
end

% Existe la variable?
cmd = sprintf('exist(''%s'', ''var'')', variableName);
variableExists = isequal(evalin('caller', cmd), 1);
if ~variableExists
    msg = 'La variable %s no existe.';
    if ~isempty(Feedback)
        msg = [msg '\n' Feedback];
    end
    error(msg, variableName);
else
    actualValue = evalin('caller', variableName);
end

% Comprobar tamaño
sexp = size(expectedValue);
sact = size(actualValue);
if any(sexp ~= sact)
    msg0 = 'La variable %s no tiene el tamaño correcto: \n';
    msg1 = sprintf('su dimensión es %s, pero se esperaba %s.', ...
        mat2str(sexp), mat2str(sact));
    msg = [msg0, msg1];
    if ~isempty(Feedback)
        msg = [msg '\n' Feedback];
    end
    error(msg, variableName);
end

% Comprobar tipo

% Comprobar valor(es)
diffValue = abs(expectedValue - actualValue + eps);
if any(diffValue(:) > AbsoluteTolerance(:)) && ...
   any(diffValue(:) > RelativeTolerance.*abs(expectedValue(:)))
    msg0 = 'La variable %s no tiene valor(es) correcto(s).\n';
    idx = find(expectedValue ~= actualValue);
    if isvector(expectedValue)
        msg1 = sprintf('El primer valor incorrecto es: %s(%d).', ...
            variableName, idx(1));
    else
        [r, c] = ind2sub(size(actualValue), idx(1));
        msg1 = sprintf('El primer (o único) valor incorrecto es: %s(%d, %d).', ...
            variableName, r(1), c(1));
    end
    msg = [msg0 msg1];
    if ~isempty(Feedback)
        msg = [msg '\n' Feedback];
    end
    error(msg, variableName);
end
end
