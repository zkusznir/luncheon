var MealForm = React.createClass({
  clearInputFields: function() {
    ReactDOM.findDOMNode(this.refs.meal).value = "";
    ReactDOM.findDOMNode(this.refs.price).value = "";
  },
  handleAddMealClick: function(e) {
    e.preventDefault();
    var name = ReactDOM.findDOMNode(this.refs.meal).value.trim();
    var price = ReactDOM.findDOMNode(this.refs.price).value.trim();
    if (!name && !price) return;
    this.clearInputFields();
    this.props.onMealSubmit({ meal: { name: name, price: price } });
  },
  render: function() {
    return (
      <div>
        <form onSubmit={this.handleAddMealClick}>
          <input id="meal-form-name" placeholder="Name" ref="meal" />
          <input id="meal-form-price" placeholder="Price" ref="price" /> 
          <input type="submit" value="Add" />
        </form>
      </div>
    );
  }
});
