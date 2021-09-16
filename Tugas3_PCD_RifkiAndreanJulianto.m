Citra_3_bit = [1 3 4 5; 1 2 1 1; 3 3 4 7; 2 1 1 7];

% Histogram
[n m] = size(Citra_3_bit);
H = zeros(1,256) ;
for x = 1 : n
    for y = 1 : m
        ii = Citra_3_bit(x,y)
        H(ii+1) = H(ii+1) +1;
    end
end
figure(1)
grid on 
bar (0:255,H);
axis([0 10 0 10])

% Distribusi Komulatif 
for w = 1: 256
    c(w) = sum(H(1:w));
end
figure(2)
bar(0:255,c)
grid on 
axis([1 10 0 m*n])

% Histogram Equalisasi
for k = 1  : 256 
    wb(k) = round (c(k)*256/(m*n));
end
figure(3)
bar(0:255,wb)
axis([0 10 0 255])
grid on 

c = Citra_3_bit;
[n m] = size(c); 

for x = 1 : n 
    for y = 1 : m 
        ii = c(x,y);
        c(x,y) = wb(ii+1);
    end
end
