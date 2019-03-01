class Pages

attr_accessor :login, :tarefas


def initialize

    self.login = LoginPage.new
    self.tarefas = TaskPage.new
 end
end

class Component

attr_accessor :nav

def initialize

    self.nav = NavComponent.new

 end
end