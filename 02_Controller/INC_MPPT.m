function Vref = INC_MPPT(Vpv, Ipv)
%%#codegen
% Incremental Conductance MPPT
% Input : PV voltage and PV current
% Output: DC-link/PV voltage reference

persistent Vprev Iprev Vref_prev

if isempty(Vprev)
    Vprev = Vpv;
    Iprev = Ipv;
    Vref_prev = Vpv;
end

DeltaVref = 0.0002;
eps_val = 1e-6;

dV = Vpv - Vprev;
dI = Ipv - Iprev;

if abs(dV) < eps_val
    if abs(dI) < eps_val
        Vref = Vref_prev;
    elseif dI > 0
        Vref = Vref_prev + DeltaVref;
    else
        Vref = Vref_prev - DeltaVref;
    end
else
    IncCond = dI / dV;
    InstCond = -Ipv / Vpv;

    if abs(IncCond - InstCond) < eps_val
        Vref = Vref_prev;
    elseif IncCond > InstCond
        Vref = Vref_prev + DeltaVref;
    else
        Vref = Vref_prev - DeltaVref;
    end
end

Vprev = Vpv;
Iprev = Ipv;
Vref_prev = Vref;
end
