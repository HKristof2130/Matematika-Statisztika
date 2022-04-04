player1 = [0.455,0.454,0.453,0.443,0.442,0.437,0.437];
player2 = [0.4,0.43,0.48,0.5,0.67,0.63,0.8,0.75];
simulation = 1000;
ms1 = 0;
ms2 = 0;
sum_round = 0;
count_game= 0;
shoot_sum = 0;
sum_attempt = 0;
klay_mades = 1;
p1_win = 0;
p2_win = 0;





curry_win(1) = 0;
klay_win(1) = 0;





for j=1 : simulation

disp('Új játék kezdõdik')
ending = 1;
i = 0 ;
round_ms1 = 0;
round_ms2 = 0;



while( ending == 1)
    i = i + 1;
    disp('Új kör kezdõdik');
    sum_attempt = sum_attempt+2;
    
    if i > 7
        
        if shoot1(player1) == 0
            round_ms1 = round_ms1 + 1;
            ms1 = ms1 + 1;
            shoot_sum = shoot_sum+1; 
        end
        tmp = rand
        
        if player2(klay_mades) >= tmp
            k_basket = 0;
        else
            k_basket = 1;
        end
        
        if k_basket == 0
            round_ms2 = round_ms2 + 1;
            ms2 = ms2 + 1;
            shoot_sum = shoot_sum+1;
            if klay_mades < 7
                klay_mades = klay_mades + 1;
            else
                klay_mades = 7;
            end
        
        else
            klay_mades = 1;
        
        end
        
    else
        
         
        if  shoot1(player1) == 0
            round_ms1 = round_ms1 + 1;
            ms1 = ms1 + 1;
            shoot_sum = shoot_sum+1;
    
        end
        
        tmp = rand
       
        
        if player2(klay_mades) >= tmp
            k_basket = 0;
        else
            k_basket = 1;
        end
        
        if k_basket == 0
            round_ms2 = round_ms2 + 1;
            ms2 = ms2 + 1;
            shoot_sum = shoot_sum+1;
            if klay_mades < 7
                klay_mades = klay_mades + 1;
            else
                klay_mades = 7;
            end
   
        else
            klay_mades = 1;
   
        end
        
    end
    
    if i>= 8 && not(round_ms1 == round_ms2)
        if round_ms1 > round_ms2
            disp('Az elsõ játékos nyert');
            disp(round_ms1) ;
            disp('Bedobott kosárral');
            p1_win = p1_win + 1;
            curry_win(j+1) = p1_win;
            klay_win(j+1) = klay_win(j);
        else
            disp('A második játékos nyert');
            disp(round_ms2);
            disp('Bedobott kosárral');
   
            p2_win = p2_win + 1;
            klay_win(j+1) = p2_win;
            curry_win(j+1) = curry_win(j);
        end
        ending = 0;
    else
        disp('Az állás');
        disp(round_ms1);
        disp(round_ms2);
    end
    
    
    
    
end

ms1_pr(j) = round_ms1;
ms2_pr(j) = round_ms2;

count_game = count_game + 1;
sum_round = sum_round + i;




end



avg_madeshot = shoot_sum/count_game
avg_round = sum_round/count_game
avg_ms1 = sum_madeshot(ms1)/count_game
avg_ms2 = sum_madeshot(ms2)/count_game

disp('Játszott Játék')
disp(count_game);
disp('Nyerések:')
disp(p1_win)
disp(p2_win)





figure();
plot(curry_win); %kék görbe
hold on;
plot(klay_win); % piros görbe
title('Gyõzelmek')
hold off;

figure();
plot(ms1_pr) %kék görbe
hold on;
plot(ms2_pr); %sárga görbe
title('Körönkénti bedobott kosarak')
hold off;


function s = shoot1(player);
        
       basket = randi(7,1)
       curry_hasto = rand
       
       if player(basket) >= curry_hasto
           s = 0;
       else
           s = 1;
       end

end

function s = sum_madeshot(ms)
    
    s = 0;
    for i= 1: length(ms)
       s = s+ ms(i); 
    end

end

