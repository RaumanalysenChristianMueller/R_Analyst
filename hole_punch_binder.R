# Binder mit Hole-Punch aufsetzen (s. https://github.com/karthik/holepunch)

library(holepunch)
write_compendium_description(package = "R-Analyst", 
                             description = "Test-Umgebung zur Fortbildung")
write_dockerfile(maintainer = "ChristianMuellerKett", base = "rocker/binder:4.4.2") 
generate_badge()
# build_binder()
