import { $CombinedState } from "redux"

export const fetchSearchGiphys = searchTerm => {
    return $.ajax({
        method: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=wIgzOGGUvlCLZ78MniqyIgE9Yo37Ln72&limit=2`
    })
}