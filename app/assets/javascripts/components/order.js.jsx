Order = React.createClass({
  getInitialState: function() {
    return { status: null, meals: [] };
  },
  componentDidMount: function() {
    this.setState({ status: this.props.status });
    this.getMeals(this.props.id);
  },
  getMeals: function(order_id) {
    $.ajax({
      url: 'orders/' + order_id  + '/meals.json',
      dataType: 'json',
      success: function(data) {
        this.setState({ meals: data });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('orders/' + order_id  + '/meals.json', status, err.toString());
      }.bind(this)
    });
  },
  handleMealSubmit: function(meal) {
    $.ajax({
      url: 'orders/' + this.props.id + '/meals.json',
      dataType: 'json',
      type: 'POST',
      data: meal,
      success: function(data) {
        this.setState({ meals: data });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('orders/' + this.props.id  + '/meals.json', status, err.toString());
      }.bind(this)
    });
  },
  handleStatusChange: function(status) {
    $.ajax({
      url: 'orders/' + this.props.id + '.json',
      dataType: 'json',
      type: 'PUT',
      data: status,
      success: function(data) {
        this.setState({ status: data.status });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('orders/' + this.props.id + '.json', status, err.toString());
      }.bind(this)
    });
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
      <div>
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
