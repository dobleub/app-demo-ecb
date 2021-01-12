import ACTIONS from './actionsConstants';
import actionsInterface from '../interfaces/actionsInterface';

const addSetting = (data:any):actionsInterface => {
	return {
		type: ACTIONS.SETUP.ADD.ONE_QUERY,
		payload: {
			data: data
		}
	}
}

export {
	addSetting
}