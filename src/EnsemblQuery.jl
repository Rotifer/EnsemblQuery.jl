module EnsemblQuery
using HTTP
using JSON

export get_xrefs_for_ensembl_id,  get_species_symbol

base_url = "https://rest.ensembl.org/"

function get_json_for_end_point(end_point_url)
    url = "$(base_url)$(end_point_url)"
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
end

function get_xrefs_for_ensembl_id(ensembl_id)
    end_point_url = "xrefs/id/$(ensembl_id)?"
    return get_json_for_end_point(end_point_url)
end

function get_xrefs_for_species_symbol(species, sp_symbol)
    end_point_url = "/xrefs/symbol/$(species)/$(sp_symbol)?"
    return get_json_for_end_point(end_point_url)
end

end # module
