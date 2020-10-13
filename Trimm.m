function out = Trimm(psi)
    global A B
    xPrim =  A * cos(psi) + B * sin(psi);
    yPrim = A * sin(psi) - B * cos(psi);
    out = [xPrim, yPrim]; 
end

