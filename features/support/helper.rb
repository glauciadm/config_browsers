module Helper

    def tirar_foto(nome_arquivo, resultado)
        caminho_arquivo = "results/screenshots/test_#{resultado}"
        foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
        page.save_screenshot(foto) #tirar foto
        embed(foto, 'image/png', 'Clique aqui') #adicionar a foto no arquivo html
    end

end