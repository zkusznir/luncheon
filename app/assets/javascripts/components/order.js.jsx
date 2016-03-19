Order = React.createClass({
  getInitialState: function() {
    return { status: null, meals: [] };
  },
  componentWillMount: function() {
    this.setState({ status: this.props.status });
    this.getMeals(this.props.id);
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({ status: nextProps.status });
    if (this.props != nextProps) { this.getMeals(nextProps.id) };
  },
  getMeals: function(order_id) {
    Luncheon.backend('orders/' + order_id  + '/meals.json', 'GET', '').then(
      function(data) { this.setState({ meals: data });
    }.bind(this));
  },
  handleMealSubmit: function(meal) {
    Luncheon.backend('orders/' + this.props.id  + '/meals.json', 'POST', meal).then(
      function(data) { this.setState({ meals: this.state.meals.concat(data) });
    }.bind(this));
  },
  handleStatusChange: function(status) {
    Luncheon.backend('orders/' + this.props.id  + '.json', 'PUT', status).then(
      function(data) { this.setState({ status: data.status });
    }.bind(this));
  },
  render: function() {
    var mealForm;
    if (this.state.status != 'Finalized') {
      mealForm = <MealForm onMealSubmit={this.handleMealSubmit} />;
    }
    var mealNodes = this.state.meals.map(function(meal, index) {
      return (
        <Meal name={meal.name} price={meal.price} key={index} />
      );
    });
    return (
      <div className="order">
        <span>
          {this.props.name}
          <OrderStatusForm status={this.state.status} onStatusChange={this.handleStatusChange} />
        </span>
        <ul>
          {mealNodes}
        </ul>
        {mealForm}
      </div>
    );
  }
});
