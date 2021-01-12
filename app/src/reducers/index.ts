import { combineReducers } from 'redux';

import settingsReducer from './settingsReducer';

const AppReducers = combineReducers({
	settings: settingsReducer
});

export default AppReducers;