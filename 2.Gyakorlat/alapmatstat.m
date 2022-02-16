% n= input('Mennyi adatot atkarsz beadni?\n');
%for i=1: n
%   nums(i)= input('Add meg az erteket\n');
%end

nums= [3.85,3.44,2.1,2.81,3.27,2.99,1.2,1.92,3.21,1.91];

sorozat= rendezes(nums)
kozep = empirikuskozep(sorozat)
empSzoras2 = empirikusszorasnegyzet(sorozat,kozep)
korrEmpSzoras2=korrigaltszorasnegyzet(sorozat,kozep)
kmom = kdikmomentum(sorozat)
terjed = terjedelem(sorozat)
szoras6 = szorasieggyut6(sorozat)

function sorozat = rendezes(sorozat);

   for i = 1:length(sorozat)
    
   for j = 1:length(sorozat)-i
        if(sorozat(j)>sorozat(j+1))
            temp = sorozat(j+1);
            sorozat(j+1) = sorozat(j);
            sorozat(j) = temp;
        end
    end
   end
end

function emp = empirikuskozep(sorozat);
    sum=0;
    for i=1:length(sorozat)
        sum= sum+sorozat(i);
    end
    emp= sum/length(sorozat);
end

function emp = empirikusszorasnegyzet(sorozat,kozep);
    sum = 0;
    for i=1 : length(sorozat)
        sum= sum + (sorozat(i)-kozep)^2;
    end
    emp= sum/length(sorozat);

end

function emp = korrigaltszorasnegyzet(sorozat,kozep);
    sum=0;
    for i=1: length(sorozat)
        sum= sum + (sorozat(i)-kozep)^2;
    end
    
    emp = sum/(length(sorozat)-1);
end

function kmom = kdikmomentum(sorozat);
    mom = input('Melyik momentum legyen?\n');
    sum=0;
    for i=1: length(sorozat)
        sum= sum + (sorozat(i))^mom;
    end
    
    kmom = sum/length(sorozat);

end

function ter = terjedelem(sorozat);
    ter= sorozat(length(sorozat))-sorozat(1);
end

function szore = szorasieggyut6(sorozat);
    sn= (empirikusszorasnegyzet(sorozat,empirikuskozep(sorozat)))^1/2;
    szore= sn/empirikuskozep(sorozat);

end
