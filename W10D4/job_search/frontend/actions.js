export const selectLocation = ()=> {
    return {
        type: "SWITCH_LOCATION",
        city,
        jobs,
    }
}

window.selectLocation = selectLocation;