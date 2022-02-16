using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    # Write your tests here.
    @test 1 == 1
end

@testset "non convergence" begin
    f(x) = 2 + x^2
    f_prime(x) = 2x
    println(newtonroot(f, f_prime; x_0 = 0))
    @test newtonroot(f, f_prime; x_0 = 0) == nothing
end