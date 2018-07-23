package com.reliablesystems.doctoroffice.controller;

import com.reliablesystems.doctoroffice.core.service.company.CompanyService;
import com.reliablesystems.doctoroffice.core.to.common.ApiResponse;
import com.reliablesystems.doctoroffice.core.to.company.CompanyTO;
import com.reliablesystems.doctoroffice.core.utils.company.CompanyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    /**
     * Display the view of list of companies
     *
     * @param model The viewbag
     * @return The view
     */
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display(Model model) {
        return "pages/company/companyList";
    }

    /**
     * Method to find all companies
     *
     * @return List of companies
     */
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse findAllCompanies() {
        try {
            return new ApiResponse(false, companyService.findAllCompanies());
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }

    /**
     * Method to crea a new company
     *
     * @param companyTO Company data
     * @return Response
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public ApiResponse createCompany(@RequestBody CompanyTO companyTO) {
        try {
            return new ApiResponse(false, companyService.createCompany(CompanyUtil.getCompanyToCreate(companyTO)));
        } catch (Exception e) {
            e.printStackTrace();
            return new ApiResponse(true, e.getMessage());
        }
    }
}
