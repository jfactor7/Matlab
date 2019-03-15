function [y,t] = AB2(fun, y0, NSTEPS, DT, IOSTEP)

%     u0 = y0;
%     y = y0; 
%     for i = 1: NSTEPS
%         t0 = f(y0,1) + DT; 
%         u1 = u0 + DT / 2 * (fun(u0, t0) + fun(u0 + DT * fun(u0, t0), t0) );
%         y1 = u1 + DT / 2 * (3 * f(u1, t0) - f(u0, t0)); 
%         if mod(NSTEPS, IOSTEP) == 0
%             y = [y y1];
%         end
%         u0 = u1; 
%         t0 = t0 + 
%     end
    % hun
    y = y0;
    t0 = 0; 
    t = t0; 
    t0 = 0;
    u0 = y0; 
    u1 = u0 + DT .* .5 .* (fun(u0, t0) + fun(u0 + DT * (fun(u0,t0)),(t0 + DT)));
    for i = 1 : NSTEPS
        t0 = t0 + DT; 
        newU = u1 + .5 .* DT .* (3 .* fun(u1, t0) - fun(u0, t0-DT));
        u0 = u1; 
        u1 = newU; 
        if mod(i, IOSTEP) == 0
            y = [y u1]; 
            t = [t t0]; 
        end 
    end
end