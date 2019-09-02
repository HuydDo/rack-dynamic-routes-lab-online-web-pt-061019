class Application
def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match(/items/)
    item_name = req.path.split("/items/").last
    #turn /items/name into name
    item = @@items.find{|i| i.name == item_name}
      resp.write item.price
    end

  resp.finish
end