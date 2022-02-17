using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    # Write your tests here.
    f_1(x) = x^2 - 3x + 2
    f_2(x) = sin(x)
    f_3(x) = log(x)
    f_4(x) = 1/x - 4
    f_5(x) = x+3
    f_6(x) = 3
    f_7(x) = 0
    f_8(x) = exp(x) - 5
    f_prime_1(x) = 2x - 3
    f_prime_2(x) = cos(x)
    f_prime_3(x) = 1/x
    f_prime_4(x) = -1/(x^2)
    f_prime_5(x) = 1
    f_prime_6(x) = 0
    f_prime_7(x) = 0
    f_prime_8(x) = exp(x)
    @test newtonroot(f_1, f_prime_1; x_0 = 0) ≈ 1
    @test newtonroot(f_2, f_prime_2; x_0 = 3) ≈ π
    @test newtonroot(f_3, f_prime_3; x_0 = 0.7) ≈ 1
    @test newtonroot(f_4, f_prime_4; x_0 = 0.4) ≈ 0.25
    @test newtonroot(f_5, f_prime_5; x_0 = 0) ≈ -3
    @test newtonroot(f_6, f_prime_6; x_0 = 1) === nothing
    @test newtonroot(f_7, f_prime_7; x_0 = 4) == 4 
    @test newtonroot(f_8, f_prime_8; x_0 = 3) ≈ log(5)
    @test newtonroot(f_1; x_0 = 0) ≈ 1
    @test newtonroot(f_2; x_0 = 3) ≈ π
    @test newtonroot(f_3; x_0 = 0.7) ≈ 1
    @test newtonroot(f_4; x_0 = 0.4) ≈ 0.25
    @test newtonroot(f_5; x_0 = 0) ≈ -3
    @test newtonroot(f_6; x_0 = 1) === nothing
    @test newtonroot(f_7; x_0 = 4) == 4
    @test newtonroot(f_8; x_0 = 3) ≈ log(5)
end

@testset "non convergence" begin
    f(x) = x^2+2
    f_prime(x) = 2x
    @test newtonroot(f, f_prime; x_0 = 0) === nothing
    @test newtonroot(f, f_prime; x_0 = 0.5) === nothing
    @test newtonroot(f;x_0 = 0) === nothing
    @test newtonroot(f;x_0 = 0.5) === nothing
end

@testset "Big Float" begin
    f(x) = x^2 - 3x + 2
    f_prime(x) = 2x - 3
    x_0 = parse(BigFloat, "0.34")
    @test convert(Float64, newtonroot(f, f_prime; x_0 = x_0)) ≈ 1
    @test convert(Float64, newtonroot(f; x_0 = x_0)) ≈ 1
end

@testset "max iter" begin
    f(x) = exp(x) - 5
    f_prime(x) = exp(x)
    @test newtonroot(f, f_prime; x_0 = 0, maxiter = 5) === nothing
    @test newtonroot(f; x_0 = 0, maxiter = 5) === nothing
end

@testset "tolerance" begin
    f(x) = 3
    f_prime(x) = 3
    @test newtonroot(f, f_prime; x_0 = 4, tol = 3) == 4
    @test newtonroot(f; x_0 = 4, tol = 3) == 4
end