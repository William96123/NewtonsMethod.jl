module NewtonsMethod
export newtonroot

using ForwardDiff
# Write your package code here.

function newtonroot(f, f_prime; x_0, tol = 1e-7, maxiter = 1000)
    err = Inf
    iter = 0
    x = x_0
    while err > tol && iter <= maxiter
        if x == 0
            x = 1e-10
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
