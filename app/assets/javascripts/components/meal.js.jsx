var Meal = React.createClass({
  render: function() {
    return (
      <li>{this.props.name} {this.props.price}</li>
    )
  }
});
