function update_state = eulerupdate(W, ui)
    update_state = ui + ((-ui) + W*sign(ui))*0.2;
end