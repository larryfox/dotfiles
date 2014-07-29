if isinteractive()
    repl = Base.active_repl
    repl.interface = Base.REPL.setup_interface(repl)
    repl.interface.modes[1].first_prompt = \
        repl.interface.modes[1].prompt = " \U0B83 "
end
