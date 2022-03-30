player1 = [0.455,0.454,0.453,0.443,0.442,0.437,0.437];
player2 = [0.4,0.43,0.48,0.5,0.67,0.63,0.8,0.75];
simulation = 10000;
ms1 = 0;
ms2 = 0;
sum_round = 0;
count_game= 0;
shoot_sum = 0;
sum_attempt = 0;
klay_mades = 1;
p1_win = 0;
p2_win = 0;

money_on_p1 = 100;
money_on_p2 = 100;
graph_m1(1) = 100;
graph_m2(1) = 100;






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
    
    if i>= 6 && not(round_ms1 == round_ms2)
        if round_ms1 > round_ms2
            disp('Az elsõ játékos nyert');
            disp(round_ms1) ;
            disp('Bedobott kosárral');
            money_on_p1 = money_on_p1 + 200;
            money_on_p2 = money_on_p2 - 100;
            graph_m1(j+1) = money_on_p1;
            graph_m2(j+1) = money_on_p2;
            p1_win = p1_win + 1;
        else
            disp('A második játékos nyert');
            disp(round_ms2);
            disp('Bedobott kosárral');
            money_on_p1 = money_on_p1 - 100;
            money_on_p2 = money_on_p2 + 200;
            graph_m1(j+1) = money_on_p1;
            graph_m2(j+1) = money_on_p2;
            p2_win = p2_win + 1;
        end
        ending = 0;
    else
        disp('Az állás');
        disp(round_ms1);
        disp(round_ms2);
    end
    
    
    
    
end

count_game = count_game + 1;
sum_round = sum_round + i;




end

avg_madeshot = shoot_sum/count_game
avg_round = sum_round/count_game
avg_shottaken = sum_attempt / count_game
disp('Játszott Játék')
disp(count_game);
disp('Ha az elsõ játékosra fogadtunk')
disp(money_on_p1)
disp('Ha a második játékosra fogadtunk')
disp(money_on_p2)
disp('Nyerések:')
disp(p1_win)
disp(p2_win)




plot(graph_m1);
hold on;
plot(graph_m2);
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

