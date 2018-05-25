import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: "", num2: "", result: 0 }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  //your code here

  render(){
    return (
      <div>
        <h1>Hello World</h1>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>
        <button onClick={this.clear}>Clear</button>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }

  setNum1(e){
    let num;
    if (e.target.value) {
      num = parseInt(e.target.value);
    } else {
      num = "";
    }

    const num1 = num;
    this.setSate({ num1 })
  }

  setNum2(e){
    let num;
    if (e.target.value) {
      num = parseInt(e.target.value);
    } else {
      num = "";
    }

    const num2 = num;
    this.setSate({ num2 })
  }

  add(e){
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setSate({ result });
  }

  substract(e){
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setSate({ result });
  }

  multiply(e){
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setSate({ result });
  }

  divide(e){
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setSate({ result });
  }

  clear(e){
    e.preventDefault();
    this.setState({ num1: "", num2: "", result: 0 });
  }

}

export default Calculator;
