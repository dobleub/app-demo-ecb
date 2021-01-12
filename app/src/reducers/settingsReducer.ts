import ACTIONS from '../actions/actionsConstants';
import actionsInterface from '../interfaces/actionsInterface';

const settingsReducer = (state:any = {}, action:actionsInterface) => {
	switch (action.type) {
		case ACTIONS.SETUP.ADD.ONE_QUERY:
			const newState = Object.assign({}, state, action.payload.data);
			return newState;
			
		default:
			return state
	}
}

export default settingsReducer;