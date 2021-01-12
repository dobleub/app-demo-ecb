import React from 'react';
import { connect } from 'react-redux';

import './Navbar.css';

function Navbar({settings}:any) {
	return (
		<div className="topnav">
			<a className="active" href="#home">Home</a>
		</div>
	);
}

const mapStateToProps = (state:any) => ({
	settings: state.settings
});

export default connect(mapStateToProps, null)(Navbar);
