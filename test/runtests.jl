using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    # Write your tests here.
    @test 1 == 1
end

@testset "non convergence" begin
    f(x) = x^2+2
    f_prime(x) = 2x
    @test newtonroot(f, f_prime; x_0 = 0) == nothing
    @test newtonroot(f, f_prime; x_0 = 0.5) == nothing
    @test newtonroot(f;x_0 = 0) == nothing
    @test newtonroot(f;x_0 = 0.5) == nothing

end