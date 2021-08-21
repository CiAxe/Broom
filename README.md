# Broom
**Broom Class**. This Class handles `Connections` for `Events` and `Functions`. 

This Class was highly inspired off of [Maid Class](https://github.com/Quenty/NevermoreEngine/blob/version2/Modules/Shared/Events/Maid.lua). Except **Broom Class** `Index's` your `Tasks` for easy management. 

# Usage

### `.new()`
- Creates a new class and `Returns` a `MetaTable`
 ```lua
  local Broom = broom.new()
  ```

### `:Give(MethodName, Task)`
- Creates a new class and `Returns` `nil`
 ```lua
  --.. If Task is an Event
  Broom:Give("Heartbeat", RunService.Heartbeat:Connect(function()  end))
  
  --.. If Task is a Function
  Broom:Give("OnLeave", function()  end)
  
  --.. If Task is an Instance
  Broom:Give("Instance", Part)
  ```
  
### `:Sweep(MethodName)`
  - Cleans Task that is assigned to Index and `Returns` `nil`
```lua
Broom:Sweep("Heartbeat")
```

### `:SweepAll()`
  - Cleans up every Task in `MetaTable` and `Returns` `nil`
```lua
Broom:SweepAll()
```

### `:_Toss(Task)`
  - Cleans up Task by `Disconnecting` / `Firing` / `Destroying`
      - ***BROOM USAGE ONLY***
