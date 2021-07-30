module EnsemblQuery
using HTTP
using JSON

export get_xrefs_for_ensembl_id

base_url = "https://rest.ensembl.org/"

function get_xrefs_for_ensembl_id(ensembl_id)
    url = "($base_url)xrefs/id/$(ensembl_id)?"
    try
        response = HTTP.request("GET", url,
                                [
                                  "Content_Type" => "application/json"
                                ])
        if response.status == 200
            result = JSON.parse(String(response.body))
            return JSON.json(result)
        else
            error("ERROR: HTTP response $(response.status) for URL $(url)")
        end
    catch y
        println("HTTP request failed: $y.")
    end
end


end # module
