module EnsemblQuery

export getxrefsforgene

function getxrefsforgene(ensembl_gene_id)
    try
        response = HTTP.request("GET", "https://rest.ensembl.org/xrefs/id/" * ensembl_gene_id * "?", 
                               [
                                 "Content_Type" => "application/json"
                               ])
        if resonse.status == 200
            result = JSON.parse(String(response.body))
            return JSON.json(result)
        else
            error("REST call error")
        end
    catch y
        println("HTTP request failed: $y.")
    end
end


end # module
