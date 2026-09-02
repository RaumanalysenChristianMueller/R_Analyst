# Binder mit Hole-Punch aufsetzen (s. https://github.com/karthik/holepunch)

library(holepunch)
write_compendium_description(package = "R-Analyst", 
                             description = "Test-Umgebung zur Fortbildung")
write_dockerfile(maintainer = "Christian_Mueller-Kett") 
generate_badge()
# build_binder()
