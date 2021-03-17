a = Appointment.create(job_name: "house_rewire", job_description: "rewire the whole house with new plugs", appointment_time: Date.parse('2021-05-31'), client_id: 1, contractor_id: 1)

c = Client.create(name: "Ryan", :user_attributes => {email: "ryankburns@gmail.com", password_digest: "test"})

con = Contractor.create(business_name: "A&A", license_number: 1234567, :user_attributes => {email: "a&a@gmail.com", password_digest: "test"})

r = Review.create(rating: 5, content: "A&A did an amazing job on my house rewire 10/10 100%", appointment_id: 1)
