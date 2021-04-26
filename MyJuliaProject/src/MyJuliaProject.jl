module MyJuliaProject
using NetCDF
using Statistics
sst = ncread("sst.mon.anom.nc","sst")
print(size(mean(sst,dims=[1,2])))
greet() = print("Hello World!")

end # module
