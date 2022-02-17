module NewtonsMethod
export newtonroot

using ForwardDiff
# Write your package code here.

function newtonroot(f, f_prime; x_0, tol = 1e-7, maxiter = 1000)
    err = 0
    iter = 0
    x = x_0
    while err > tol && iter <= maxiter
        if f_prime(x) == 0 || f_prime(x) == Inf || f_prime(x) == -Inf
            if rand() >= 0.5
                x = x + 1e-10
            else
                x = x - 1e-10
            end
            iter = iter+1
            err = abs(f(x))
            continue
        end
        iter = iter+1
        xNew = x - f(x)/f_prime(x)
        err = abs(f(x))
        x = xNew
    end
    if iter > maxiter
        return nothing
    end
    return x
end

function newtonroot(f; x_0, tol = 1e-7, maxiter = 1000)
    f_prime = x -> ForwardDiff.derivative(f, x)
    return newtonroot(f, f_prime; x_0 = x_0, tol = tol, maxiter = maxiter)
end
end
