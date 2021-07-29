# Creating a Julia Package for querying the Ensembl REST API

## Introduction

The purpose of this package is to develop Julia skills by implementing functionality to query the REST API.
The REST API returns JSON so it will also require expertise in JSON data wrangling skills
There is a wide range of REST API end points for a number of common programming languages documented on the Ensembl website [here](https://rest.ensembl.org)

- In GitHub, create a package called "EnsemblQuery.jl" - Note the ".jl" suffix!
- In the Julia REPL, enter pkg mode (use the ] char)

```
(@v1.6) pkg> generate EnsemblQuery
```

- Activate the package and add JSON dependency

```
(@v1.6) pkg> activate /Users/mfm45656/myjulia/myscripts/EnsemblQuery
```

## Package installation

- The local version of the package is under Git control in ~/Documents/GitHub/EnsemblQuery.jl
- To install, start Julia REPL and enter pkg mode and execute the following:

```
add https://github.com/Rotifer/EnsemblQuery.jl.git
```

- Back in REPL mode:

```
julia> using EnsemblQuery
julia> ensembl_id = "ENSG00000157764"
julia> EnsemblQuery.getxrefsforgene(ensembl_id)
```

