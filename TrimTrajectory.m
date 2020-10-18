clc
clear all
close all

%inisialise all variables
init;

if liveUpdate == 0

    %simulink simulation mode
    zP = 0.1;
    psiP = 1;
    sim('TrimIt',20)
    PlotResults;

else    
    
    %adding keyboard control
    h = figure; 
    set(h,'KeyPressFcn',@KeyPressCb);

    plot3(x,y,z,'r-');
    axis([-ss ss -ss ss -ss ss])%inertial view
    camorbit(-45,0);
    hold on

    for t = 0:0.01:simTim
        set(h,'KeyPressFcn',@KeyPressCb);
        psi = psi + psiP;
        cords = Kinematics(psi);
        x = x + cords(1);
        y = y + cords(2);
        z = z + zP;
        plot3(x,y,z,'r.'); 
        axis([-ss+x ss+x -ss+y ss+y -ss+z ss+z]);%body fixed view
        if view == 1
            camorbit(rad2deg(psiP),0);
        end
        pause(0.1)
    end
end

function y = KeyPressCb(~,evnt)
    fprintf('key pressed: %s\n',evnt.Key);
    global s view psiP psi psiPrev zP
    if strcmp(evnt.Key,'rightarrow')==1
        s = evnt.Key;
        psiP = psiP - 0.01;
    elseif strcmp(evnt.Key, 'leftarrow')==1
        s = evnt.Key;
        psiP = psiP + 0.01;
    elseif strcmp(evnt.Key, 'uparrow')==1
        s = evnt.Key;
        zP = zP + 0.01;
    elseif strcmp(evnt.Key, 'downarrow')==1
        s = evnt.Key;
        zP = zP - 0.01;
    elseif strcmp(evnt.Key,'space')==1
        s = evnt.Key;    
    elseif strcmp(evnt.Key,'c')==1
        view = ~view;
        if view 
            camorbit(rad2deg(psi-psiPrev),0);
        else
            psiPrev = psi;
        end
        s = evnt.Key;
    elseif strcmp(evnt.Key,'x')==1
        exit; 
    end
end

%{
Report:
-start from matrices r,t (kinematics)
-derive trim trajcetory 
-prove helical trajectory
-draw and simulate the system
-state any assumption made
-codes and simulink with the report
-deadline: 27 10 2020
-email: akrameltrabyly@gmail.com
%}
