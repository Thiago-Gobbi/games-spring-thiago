package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Plataforma;
import application.repository.PlataformaRepository;

@Controller
@RequestMapping("/plataforma")
public class PlataformaController {

    @Autowired
    private PlataformaRepository plataformaRepo;

    // Método para listar todas as plataformas
    @RequestMapping("/list")
    public String list(Model ui) {
        ui.addAttribute("plataformas", plataformaRepo.findAll()); // Correção aqui
        return "plataforma/list";
    }

    // Método para mostrar o formulário de inserção
    @RequestMapping("/insert")
    public String insert() {
        return "plataforma/insert";
    }

    // Método para inserir uma nova plataforma
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("nome") String nome) {
        Plataforma plataforma = new Plataforma();
        plataforma.setNome(nome);

        plataformaRepo.save(plataforma); // Salvando a plataforma no banco

        return "redirect:/plataforma/list"; // Redirecionando para a lista de plataformas
    }

    // Método para mostrar o formulário de atualização
    @RequestMapping("/update")
    public String update(@RequestParam("id") long id, Model ui) {
        Optional<Plataforma> plataforma = plataformaRepo.findById(id);
        
        if (plataforma.isPresent()) {
            ui.addAttribute("plataforma", plataforma.get());
            return "plataforma/update";
        }

        return "redirect:/plataforma/list";
    }

    // Método para atualizar uma plataforma existente
    @RequestMapping(value = "/update", method = RequestMethod.POST) // Corrigido para RequestMethod.POST
    public String update(
        @RequestParam("id") long id,
        @RequestParam("nome") String nome
    ) {
        Optional<Plataforma> plataforma = plataformaRepo.findById(id);

        if (plataforma.isPresent()) {
            plataforma.get().setNome(nome);
            plataformaRepo.save(plataforma.get()); // Atualizando a plataforma no banco
        }

        return "redirect:/plataforma/list"; // Redirecionando para a lista de plataformas
    }

    // Método para mostrar o formulário de deleção
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") long id, Model ui) {
        Optional<Plataforma> plataforma = plataformaRepo.findById(id); // Corrigido de "ud" para "id"
        
        if (plataforma.isPresent()) {
            ui.addAttribute("plataforma", plataforma.get());
            return "plataforma/delete";
        }

        return "redirect:/plataforma/list"; // Redirecionando caso não encontre a plataforma
    }

    // Método para deletar uma plataforma
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id) {
        plataformaRepo.deleteById(id); // Deletando a plataforma do banco

        return "redirect:/plataforma/list"; // Redirecionando para a lista de plataformas
    }
}
