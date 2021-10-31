import MessageDisplay from '../../resources/js/components/MessageDisplay.vue';
import { mount } from '@vue/test-utils';
 import { getMessage } from '../../resources/js/services/axios.js';
 import flushPromises from 'flush-promises';
 
//mocks the call to the API
jest.mock('../../resources/js/services/axios.js');  

//clear out the mock before each test
beforeEach(()=>{
    jest.clearAllMocks();
})
describe('MessageDisplay', () => {
    test("Calls getMessage and displays message", async ()=>{
        //mock the API
        let mockMessage = "Hello from the db!";
        getMessage.mockResolvedValueOnce({ "text": mockMessage });
        let wrapper = mount(MessageDisplay);
        //wait for the promise to resolve
        await flushPromises();
        //check the call happened once
        expect(getMessage).toHaveBeenCalledTimes(1);
        //check the component displays message
        let message = wrapper.find('[data-testid="message"]').text();
        expect(message).toEqual(mockMessage);
    });

    test("Displays error message when request fails", async ()=>{
        let mockError = 'Oops! Something went wrong.';
        //mock the API
        getMessage.mockRejectedValueOnce();
        const wrapper = mount(MessageDisplay);
        //wait for the promise to resolve
        await flushPromises();
        //check the call happened once
        expect(getMessage).toHaveBeenCalledTimes(1);
        //check the component displays error message
        let message = wrapper.find('[data-testid="message-error"]').text();
        expect(message).toEqual(mockError);
    })
})