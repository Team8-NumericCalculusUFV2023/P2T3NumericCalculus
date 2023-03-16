function G = Cholesky(A)


n = size(A,1);
G = triu(n);

for j=1:n
    for k=1:j-1
        A(j,j) = A(j,j) - G(k,j)^2;
    end
    G(j,j) = sqrt(A(j,j));
    for i=j+1:n
        for k=1:j-1
            A(i,j) = A(i,j) - G(k,i)*G(k,j);
        end
        G(j,i) = A(i,j)/G(j,j);
    end
end