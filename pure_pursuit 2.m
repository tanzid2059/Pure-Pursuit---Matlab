Xa=0;Ya=1000;
Xb=12000;Yb=2000;
Xc=10000;Yc=10000;
Xd=5000;Yd=15000;

Va=60;Vb=60;Vc=60;Vd=60;

Da=1000;
time_limit=300;

ab=0;bc=0;cd=0;

plot(Xa,Ya,"-r.");plot(Xb,Yb,"-g.");
plot(Xc,Yc,"-b.");plot(Xd,Yd,"-y.");

Dt=1;time=0;

while time<=time_limit
    if(ab==0)
        dist_ab=sqrt((Xb-Xa)^2+(Yb-Ya)^2);
        if(dist_ab<=Da) 
            ab=1;
            bc=1;
            disp("a catch b");
        end   
        Xa=Xa+(Va*Dt)*((Xb-Xa)/dist_ab);
        Ya=Ya+(Va*Dt)*((Yb-Ya)/dist_ab);
        
        plot(Xa,Ya,"-r.",'linewidth',8);
        hold on;
    end
    if(bc==0)
        dist_bc=sqrt((Xb-Xc)^2+(Yb-Yc)^2);
        if(dist_bc<=Da) 
            bc=1;
            cd=1;
            disp("b catch c");
        end
        Xb=Xb+(Vb*Dt)*((Xc-Xb)/dist_bc);
        Yb=Yb+(Vb*Dt)*((Yc-Yb)/dist_bc);
        
        plot(Xb,Yb,"-g.",'linewidth',8);
    end
    if(cd==0)
        dist_cd=sqrt((Xc-Xd)^2+(Yc-Yd)^2);
        if(dist_cd<=Da)
            cd=1;
            disp("c catch d");
        end
        Xc=Xc+(Vc*Dt)*((Xd-Xc)/dist_cd);
        Yc=Yc+(Vc*Dt)*((Yd-Yc)/dist_cd);
   
        Xd=Xd-(Vd*Dt);
        
        plot(Xc,Yc,"-b.",'linewidth',8);
        plot(Xd,Yd,"-y.",'linewidth',8);
    end
    time=time+Dt;
    if(ab==1 && bc==1 && cd==1)
        break;
    end
end
disp(time);