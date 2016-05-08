if isinteractive()
    function customize_promp(repl)
        repl.interface = Base.REPL.setup_interface(repl)
        repl.interface.modes[1].first_prompt = \
            repl.interface.modes[1].prompt = " ∴ "
    end

    atreplinit(customize_promp)
end
