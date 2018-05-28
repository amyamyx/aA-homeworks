const initialState = {
  city: "Please Select",
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch(action.type) {
    case "SWITCH_LOCATION":
      return Object.assign({}, state, {city: action.city, jobs: action.jobs})
      // return {
      //   ...state,
      //   city: action.city,
      //   jobs: action.jobs
      // };
    default:
      return state;
  }
};

window.reducer = reducer;
export default reducer;
