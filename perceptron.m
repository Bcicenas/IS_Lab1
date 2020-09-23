%Init variables
INPUT = readmatrix('Data.txt');
INPUT2 = readmatrix('Data2.txt');
h = size(INPUT, 1);
h2 = size(INPUT2, 1);
w1 = randn(1);
w2 = randn(1);
b = randn(1);
n = 100;
nu = 0.3;
y = 0;

for i = 1:n
    E = zeros(1, h2);
    for j = 1:h2
        X1 = INPUT2(j,1);
        X2 = INPUT2(j,2);
        T = INPUT2(j,3);
        %calculate function
        f = X1*w1 + X2*w2 + b;
        %check sign
        y = sign(f);
        %get error
        E(j) = T - y;
        
    end
    
    %update w1, w2 and b
    for j = 1:h2
        X1 = INPUT2(j,1);
        X2 = INPUT2(j,2);
        T = INPUT2(j,3);
        
        w1 = w1 + nu*E(j)*X1;
        w2 = w2 + nu*E(j)*X2;
        b = b + nu*E(j);
    end
end

% display weights
disp(w1);
disp(w2);
disp(b);

% test 
TEST = readmatrix('test.txt');
ht = size(TEST, 1);
ANS = zeros(1, ht);
for i = 1:ht
   y = TEST(i,1)*w1 + TEST(i,2)*w2 + b; 
   ANS(i) = sign(y);
end
disp(ANS);

function s = sign(x)
    if x > 0
        s = 1;
    else
        s = -1;
    end
end
