module EnsemblQuery
using HTTP
using JSON
export getxrefsforgene

function getxrefsforgene()
    try
        response = HTTP.request("GET", "https://rest.ensembl.org/xrefs/id/ENSG00000157764?", 
                                [
                                  "Content_Type" => "application/json"
                                ])
        result = JSON.parse(String(response.body))
        println(JSON.json(result))
        println(response.status)
    catch y
        println("HTTP request failed: $y.")
        #exit()
    end
end


end # module
