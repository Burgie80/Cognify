% Datos del caso
acusado(3, "Andrés Mendoza", "Feminicida de Atizapán").
crimen(3, feminicidio_serial).
nivel_empatia(3, muy_bajo).

% Recuerdos disponibles
recuerdo_disponible("sufrimiento extremo").
recuerdo_disponible("impacto social devastador").
recuerdo_disponible("familias destruidas").
recuerdo_disponible("desesperación de las víctimas").
recuerdo_disponible("pérdida de confianza en la humanidad").

% Resultados esperados
resultado_esperado(3, "consciencia de atrocidad").

seleccionar_recuerdo(Crimen, Empatia, Recuerdo) :-
    crimen(_, Crimen),
    nivel_empatia(_, Empatia),
    (
        (Crimen = feminicidio_serial, Empatia = muy_bajo, Recuerdo = "dolor de las víctimas");
        (Crimen = feminicidio_serial, Empatia = muy_bajo, Recuerdo = "destrucción familiar");
        (Crimen = canibalismo_serial, Empatia = nulo, Recuerdo = "sufrimiento extremo");
        (Crimen = canibalismo_serial, Empatia = nulo, Recuerdo = "impacto social devastador");
        (Crimen = canibalismo_serial, Empatia = nulo, Recuerdo = "desesperación de las víctimas");
        (Crimen = canibalismo_serial, Empatia = nulo, Recuerdo = "pérdida de confianza en la humanidad")
    ).

evaluar_impacto(Recuerdo, Impacto) :-
    (
        Recuerdo = "dolor de las víctimas", Impacto = "empatía generada";
        Recuerdo = "destrucción familiar", Impacto = "remordimiento profundo";
        Recuerdo = "sufrimiento extremo", Impacto = "despertar de conciencia";
        Recuerdo = "impacto social devastador", Impacto = "consciencia colectiva";
        Recuerdo = "desesperación de las víctimas", Impacto = "reflexión intensa";
        Recuerdo = "pérdida de confianza en la humanidad", Impacto = "reconexión emocional"
    ).

rehabilitacion(Acusado, Resultado) :-
    acusado(Acusado, _, _),                      % Verifica que el acusado existe
    crimen(Acusado, Crimen),                     % Obtiene el crimen asociado al acusado
    nivel_empatia(Acusado, Empatia),             % Obtiene el nivel de empatía del acusado
    seleccionar_recuerdo(Crimen, Empatia, Recuerdo), % Selecciona un recuerdo relevante
    evaluar_impacto(Recuerdo, Impacto),          % Evalúa el impacto del recuerdo
    Impacto = "remordimiento profundo",          % Solo considera este impacto
    Resultado = "rehabilitación parcial".        % Resultado asociado al impacto

