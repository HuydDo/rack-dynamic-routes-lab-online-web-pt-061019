require 'pry'
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      #turn /items/name into name
      item = @@items.find{|i| i.name == item_name}
      binding.pry
        # resp.write "item.price"
      item.price
      resp.status = 200
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
