Order = React.createClass({
  getInitialState: function() {
    return { meals: [] };
  },
  componentDidMount: function() {
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
  render: function() {
    var mealNodes = this.state.meals.map(function(meal, index) {
      return (
        <Meal name={meal.name} price={meal.price} key={index} />
      );
    });
    return (
      <div>
        <p>{this.props.name} ({this.props.status})</p>
        <ul>
          {mealNodes}
        </ul>
      </div>
    );
  }
});
