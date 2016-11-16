
r = zeros(1000, 1);
u = zeros(1000, 1);
all_rolls = zeros(1000, 4);
for n=1:1000
    rolls = randi([1,6],1,4);
    all_rolls(n,:) = rolls;
    r(n) = sum(find(rolls==6)) > 0;
    u(n) = mean(r(1:n));
end


figure
subplot(2,1,1);
plot(1:1000, u, 1:1000, ones(1000, 1) - (5/6)^4);
xlabel('Number of trials')
ylabel('Fraction of trials with a 6');
title('Likelihood of at Least One of Four Dice Being a Six')
legend('Running mean', 'Theoretical mean: 1 - (5/6)^4')

subplot(2,1,2);
histogram(all_rolls, 6);
title('Number of Times Each Die Number was Rolled in 1000 Trials')
xlabel('Die number')
ylabel('Number of occurences')