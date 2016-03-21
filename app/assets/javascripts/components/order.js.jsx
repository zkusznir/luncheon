Order = React.createClass({
  getInitialState: function() {
    return { status: null, meals: [], totalPrice: 0.0, errorMessage: '' };
  },
  componentWillMount: function() {
    this.setState({ status: this.props.status });
    this.getMeals(this.props.id);
  },
  componentWillUpdate: function() {
    this.evaluateTotalPrice();
  },
  evaluateTotalPrice: function() {
    var sum = 0.0;
    for (var i = 0; i < this.state.meals.length; i++) {
      sum += parseFloat(this.state.meals[i].price);
    }
    return sum;
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({ status: nextProps.status });
    if (this.props != nextProps) { this.getMeals(nextProps.id) };
  },
  getMeals: function(order_id) {
    Luncheon.backend('orders/' + order_id  + '/meals.json', 'GET', '').then(
      function(data) {
        this.setState({ meals: data });
        this.setState({ totalPrice: this.evaluateTotalPrice() });
    }.bind(this));
  },
  handleMealSubmit: function(meal) {
    Luncheon.backend('orders/' + this.props.id  + '/meals.json', 'POST', meal).then(
      function(data) {
        if (data.error) {
          this.setState({ errorMessage: 'Oops! You have already ordered something here!' })
        } else {
          this.setState({ meals: this.state.meals.concat(data), errorMessage: '' });
          this.setState({ totalPrice: this.state.totalPrice + parseFloat(data.price) });
        }
    }.bind(this));
  },
  handleStatusChange: function(status) {
    Luncheon.backend('orders/' + this.props.id  + '.json', 'PUT', status).then(
      function(data) { this.setState({ status: data.status });
    }.bind(this));
  },
  render: function() {
    var mealForm;
    var errorMessage;
    if (this.state.status != 'Finalized') {
      mealForm = <MealForm onMealSubmit={this.handleMealSubmit} />;
    }
    if (this.state.errorMessage != '') {
      errorMessage = <b className='info' ref='errors'>{this.state.errorMessage}</b>;
    }
    var mealNodes = this.state.meals.map(function(meal, index) {
      return (
        <Meal name={meal.name} price={meal.price} key={index} index={index} />
      );
    });
    return (
      <div className='order'>
        <div className='order__title'>
          <h3><b>{this.props.name}</b></h3>
          <OrderStatusForm status={this.state.status} onStatusChange={this.handleStatusChange} />
        </div>
        <div className='order__meals'>
          {errorMessage}
          {mealNodes}
          <hr />
          <div>Total: {Number(this.state.totalPrice).toFixed(2)} zł</div>
        </div>
        <div>
          {mealForm}
        </div>
      </div>
    );
  }
});
