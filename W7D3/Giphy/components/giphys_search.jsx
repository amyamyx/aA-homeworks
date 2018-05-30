import React from 'react';

import GiphysIndex from './giphys_index';

class GiphySearch extends React.Component {
  constructor() {
    super();
    this.state = { giphys: []};
  }

  render() {
    return (
      <div>
        <GiphyIndex/>
      </div>
    )
  }
}