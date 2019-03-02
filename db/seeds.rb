# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
    organisation = Organization.create(name: 'Clecotech International Pvt Ltd')

    employees = [
      {employee_id: "C-102" , account_no: '091601515535', ifsc: "ICIC0000011", name: "ASHISH PRAJAPATI", email: "ashish@clecotech.com", bank: true},
      {employee_id: "C-101" , account_no: '657301657509', ifsc: "ICIC0000011", name: "MANISH SHRIVASTAVA", email: "manish@clecotech.com", bank: true},
      {employee_id: "C-103" , account_no: '657301657477', ifsc: "ICIC0000011", name: "DEEPTI SHRIVASTAVA", email: "deepti@clecotech.com", bank: true},
      {employee_id: "C-118" , account_no: '347701503084', ifsc: "ICIC0000011", name: "TANMAY BHAWSAR", email: "tanmay.bhawsar@clecotech.com", bank: true},
      {employee_id: "C-119" , account_no: '24101534472', ifsc: "ICIC0000011", name: "YASH DUBEY", email: "yash.dubey@clecotech.com", bank: true},
      {employee_id: "C-126" , account_no: '24101534556', ifsc: "ICIC0000011", name: "HARSHIT SHARMA", email: "harshit.sharma@clecotech.com", bank: true},
      {employee_id: "C-125" , account_no: '657301657454', ifsc: "ICIC0000011", name: "DIVYANSHU RATHORE", email: "divyanshu.rathore@clecotech.com", bank: true},
      {employee_id: "C-127" , account_no: '657301659511', ifsc: "ICIC0000011", name: "DHEERAJ KUSHWAH", email: "dheeraj.kushwah@clecotech.com", bank: true},
      {employee_id: "C-129" , account_no: '657301659102', ifsc: "ICIC0000011", name: "ALOK GOUR", email: "alok.gour@clecotech.com", bank: true},
      {employee_id: "C-130" , account_no: '657301659101', ifsc: "ICIC0000011", name: "MONIKA SONI", email: "monika.soni@clecotech.com", bank: true},
      {employee_id: "C-131" , account_no: '657301659611', ifsc: "ICIC0000011", name: "SONU KUMAR", email: "sonu.kumar@clecotech.com", bank: true},
      {employee_id: "C-132" , account_no: '237101503942', ifsc: "ICIC0000011", name: "PRADEEP JAISWAL", email: "pradeep.jaiswal@clecotech.com", bank: true},
      {employee_id: "C-133" , account_no: '20192303562', ifsc: "SBIN0004089", name: "HARSHA KARDA", email: "harsha.karda@clecotech.com", bank: false},
      {employee_id: "C-134" , account_no: '20092649130', ifsc: "SBIN0004092", name: "AASHESH KUMAR SHARMA", email: "aashesh.sharma@clecotech.com", bank: false},
      {employee_id: "C-135" , account_no: '94601508171', ifsc: "ICIC0000011", name: "AKASH RAJPUT", email: "akash.rajput@clecotech.com", bank: true},
      {employee_id: "C-136" , account_no: '24101529428', ifsc: "ICIC0000011", name: "VAIBHAV DWIVEDI", email: "vaibhav.dwivedi@clecotech.com", bank: true},
      {employee_id: "C-139" , account_no: '24101529427', ifsc: "ICIC0000011", name: "PUNIT NAGAR", email: "punit.nagar@clecotech.com", bank: true},
      {employee_id: "C-112" , account_no: '657301657511', ifsc: "ICIC0000011", name: "HONEY YADAV", email: "honey.yadav@clecotech.com", bank: true}
    ]

    employees.each do |emp|
      random_password = SecureRandom.hex (7)
      user = User.new(:name => emp[:name] , :employee_id => emp[:employee_id], :email => emp[:email], :password => random_password, :password_confirmation => random_password, :organization_id => organisation.id)
      user.build_account(:account_no => emp[:account_no], :ifsc => emp[:ifsc], :bank => emp[:bank])
      user.save
      if ["ashish@clecotech.com", "manish@clecotech.com"].include?(emp[:email])
        user.add_role :admin
      elsif ["aashesh.sharma@clecotech.com"].include?(emp[:email])
        user.add_role :HR
      else
        user.add_role :employee
      end
    end
